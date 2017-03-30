import {tasksUrl, getArtpack} from './../../config'
import Vue from 'vue'
const state = {
  currentTask: null,
  tasks: null,
  currentForm: {},
  currentChat: {},
  loading: '',
  alert: '',
  stage: '',
  tasksLoading: '',
  taskLoading: '',
  notificationIds: null,
  notifications: null
}

const mutations = {
  SET_TASKS_ARRAY (state, obj) {
    state.tasks = obj
    state.tasksLoading = false
  },
  SET_CURRENT_TASK (state, obj) {
    state.currentTask = obj
    window.localStorage.setItem('currentTask', JSON.stringify(obj))
  },
  SET_CURRENT_FORM (state, obj) {
    state.currentForm = obj
  },
  SET_CURRENT_CHAT (state, obj) {
    state.currentChat = obj
  },
  SET_LOADING (state, obj) {
    state.loading = obj
  },
  SET_ALERT (state, obj) {
    state.alert = obj
  },
  SET_STAGE (state, obj) {
    state.stage = obj
  },
  SET_TASKS_LOADING (state, obj) {
    state.tasksLoading = obj
  },
  SET_TASK_LOADING (state, obj) {
    state.taskLoading = obj
  },
  SET_NOTIFICATION_IDS (state, obj) {
    state.notificationIds = obj
    state.tasksLoading = false
  },
  SET_NOTIFICATIONS (state, obj) {
    state.notifications = obj
  },
  ADD_MESSAGE (state, obj) {
    state.tasks[obj.count].task.messages.push(obj.message)
    if (obj.taskId === state.currentTask.id) {
      state.currentTask = state.tasks[obj.count].task
      window.localStorage.setItem('currentTask', JSON.stringify(state.tasks[obj.count].task))
    }
  }
}

const actions = {
  setTasksArray: ({commit}, obj) => {
/*
    var notifications = []
    const postData = {
      id: obj.user_id
    }

    Vue.http.post(getNotifications, postData)
      .then(response => {
        commit('SET_NOTIFICATIONS', response.data)
        response.data.forEach(function (notification) {
          notifications.push(notification.data.task)
        })
        console.log(notifications)
        commit('SET_NOTIFICATION_IDS', notifications)
        if (response.status === 200) {
*/
    return new Promise((resolve, reject) => {
      const post = {
        userId: parseInt(obj.user.id),
        accessLevel: obj.user.admin,
        groups: obj.user_groups
      }
      Vue.http.post(tasksUrl, post)
        .then(response => {
          if (response.status === 200) {
            var finalTasks = []
            var gr = obj.user_groups.length
            var notActiveTasks = []
            response.data.forEach(function (t) {
              var groupCheck
              if (gr === 0 || !gr) {
                groupCheck = false
              } else {
                obj.user_groups.forEach(function (group) {
                  if (t.task.app_group === group.group_name) {
                    groupCheck = true
                  }
                })
              }
              if (parseInt(t.task.app_worker) === parseInt(obj.user.id) || groupCheck) {
                const obj = {
                  task: t.task,
                  notify: t.notify
                }
                finalTasks.push(obj)
              } else {
                const obj = {
                  task: t.task,
                  notify: t.notify
                }
                notActiveTasks.push(obj)
              }
            })
            notActiveTasks.forEach(function (not) {
              const notObj = {
                task: not.task,
                notify: not.notify
              }
              finalTasks.push(notObj)
            })
            commit('SET_TASKS_ARRAY', finalTasks)
            resolve('tasks_set')
          }
        })
    })
  },
  setCurrentTask: ({commit}, obj) => {
    if (obj === '') {
      commit('SET_CURRENT_TASK', null)
      // commit('SET_CURRENT_FORM', null)
      commit('SET_CURRENT_CHAT', null)
    } else {
      return new Promise((resolve, reject) => {
        /* const postData = {
          task_id: obj
        }
        Vue.http.post(getTask, postData)
          .then(response => {
            if (response.status === 200) { */
        commit('SET_CURRENT_TASK', obj)
        // commit('SET_CURRENT_FORM', obj.form)
        // commit('SET_CURRENT_CHAT', obj.messages)
        resolve(200)
            /* }
          }, error => {
            reject(error)
          }) */
      })
    }
    /*
    if (obj !== '') {
      const postData = {
        task_id: obj
      }
      Vue.http.post(getArtpack, postData)
        .then(response => {
          if (response.status === 200) {
            commit('SET_CURRENT_FORM', response.data[0])
            const postData = {
              task_id: obj.id
            }
            Vue.http.post(getMessages, postData)
              .then(response => {
                if (response.data.length === 0) {
                  var array = []
                  var mes = {
                    name: '',
                    text: 'No Messages',
                    date: '',
                    action: ''
                  }
                  array.push(mes)
                  commit('SET_CURRENT_CHAT', array)
                } else {
                  commit('SET_CURRENT_CHAT', response.data[0].messages)
                }
                commit('SET_LOADING', false)
              })
          }
        })
    }
    */
  },
  setNewCurrentTask: ({commit}, obj) => {
    console.log('setting the new currenttask')
    return new Promise((resolve, reject) => {
      var count = 0
      var array = state.tasks
      if (obj.status === 'closed') {
        commit('SET_TASKS_LOADING', true)
        commit('SET_TASKS_ARRAY', null)
        commit('SET_TASKS_LOADING', true)
        console.log('newTask is closed')
        window.localStorage.removeItem('currentTask')
        window.localStorage.removeItem('currentWorkflow')
        commit('SET_CURRENT_TASK', null)
        array.forEach(function (t) {
          if (obj.id === t.task.id) {
            array.splice(count, 1)
          }
          count++
        })
        setTimeout(function () {
          commit('SET_TASKS_ARRAY', array)
        }, 1000)
      } else {
        commit('SET_CURRENT_TASK', obj)
      }
      // commit('SET_CURRENT_CHAT', obj.messages)
      resolve(200)
    })
  },
  setCurrentForm: ({commit}, obj) => {
    const postData = {
      task_id: obj
    }
    Vue.http.post(getArtpack, postData)
      .then(response => {
        if (response.status === 200) {
          commit('SET_CURRENT_FORM', response.data[0])
        }
      })
  },
  setCurrentChat: ({commit}, obj) => {
    commit('SET_CURRENT_CHAT', obj)
  },
  isLoading: ({commit}, obj) => {
    commit('SET_LOADING', obj)
  },
  setAlert: ({commit}, obj) => {
    var object = obj
    commit('SET_ALERT', object)
    setTimeout(function () {
      commit('SET_ALERT', '')
    }, 3000)
  },
  setStage: ({commit}, obj) => {
    return new Promise((resolve, reject) => {
      commit('SET_STAGE', obj)
      resolve('stage_set')
    })
  },
  taskLoading: ({commit}, obj) => {
    commit('SET_TASK_LOADING', obj)
  },
  setTasksLoading: ({commit}, userObj) => {
    commit('SET_TASKS_LOADING', userObj)
  },
  addMessage: ({commit}, userObj) => {
    var count = 0
    var num
    var id
    state.tasks.forEach(function (t) {
      if (t.task.id === userObj.taskId) {
        num = count
        id = t.task.id
      }
      count++
    })
    const obj = {
      message: userObj.message,
      count: num,
      taskId: id
    }
    console.log(obj)
    commit('ADD_MESSAGE', obj)
  }
}

export default {
  state, mutations, actions
}
