export const apiDomain = 'http://localhost:8000/'
export const loginUrl = apiDomain + 'oauth/token'
export const userUrl = apiDomain + 'api/user'
export const requestUrl = apiDomain + 'api/requestuser/submit'
export const artpackUrl = apiDomain + 'api/request-form/artpack/submit'
export const embroideryUrl = apiDomain + 'api/request-form/embroidery/submit'
export const tasksUrl = apiDomain + 'api/tasks/load'
export const singleTask = apiDomain + 'api/tasks/singleTask'
export const getSingleTask = apiDomain + 'api/tasks/getSingleTask'
export const getPeople = apiDomain + 'api/getPeople'
export const getGroups = apiDomain + 'api/getGroups'
export const submitWorkflow = apiDomain + 'api/submitWorkflow'
export const setSingleTask = apiDomain + 'api/setTask'
export const getArtpack = apiDomain + 'api/getArtpack'
export const uploadFile = apiDomain + 'api/uploadFile'
export const getWorkers = apiDomain + 'api/getWorkers'
export const assignTask = apiDomain + 'api/assignTask'

export const getHeader = function () {
  const tokenData = JSON.parse(window.localStorage.getItem('authUser'))
  const headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer ' + tokenData.access_token
  }
  return headers
}
