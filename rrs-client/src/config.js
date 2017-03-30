
export const apiDomain = 'http://server.paiworkflows.com/'
export const uploadDomain = 'http://paiworkflows.com/server/workflows_server/public/'
export const formDomain = 'http://paiworkflows.com/server/workflows_server/public/assets/forms/'
/*
For Staging Server/Live Server Comment or uncomment the api,upload,form domains for access

export const apiDomain = 'http://staging-server.paiworkflows.com/'
export const uploadDomain = 'http://staging.paiworkflows.com/staging-server/workflows_server/public/'
export const formDomain = 'http://staging.paiworkflows.com/staging-server/workflows_server/public/assets/forms/'
*/
export const loginUrl = apiDomain + 'oauth/token'
export const userUrl = apiDomain + 'api/user'
export const requestUrl = apiDomain + 'api/requestuser/submit'
export const artpackUrl = apiDomain + 'api/request-form/artpack/submit'
export const embroideryUrl = apiDomain + 'api/request-form/embroidery/submit'
export const tasksUrl = apiDomain + 'api/load'
export const singleTask = apiDomain + 'api/tasks/singleTask'
export const getSingleTask = apiDomain + 'api/tasks/getSingleTask'
export const getAllTasks = apiDomain + 'api/tasks/getAllTasks'
export const getPeople = apiDomain + 'api/getPeople'
export const getGroups = apiDomain + 'api/getGroups'
export const submitWorkflow = apiDomain + 'api/submitWorkflow'
export const submitWorkflowForm = apiDomain + 'api/submitWorkflowForm'
export const setSingleTask = apiDomain + 'api/setTask'
export const getArtpack = apiDomain + 'api/getArtpack'
export const uploadFile = apiDomain + 'api/uploadFile'
export const getWorkers = apiDomain + 'api/getWorkers'
export const getWorker = apiDomain + 'api/getWorker'
export const assignTask = apiDomain + 'api/assignTask'
export const submitChat = apiDomain + 'api/submitChat'
export const getMessages = apiDomain + 'api/getMessages'
export const getWorkflows = apiDomain + 'api/getWorkflows'
export const getWholeWorkflow = apiDomain + 'api/getWholeWorkflow'
export const getUserData = apiDomain + 'api/getUserData'
export const getTask = apiDomain + 'api/tasks/getTask'
export const submitApproval = apiDomain + 'api/submitApproval'
export const submitForm = apiDomain + 'api/asi/submitForm'
export const submitForApproval = apiDomain + 'api/submitForApproval'
export const submitReview = apiDomain + 'api/submitReview'
export const claimTask = apiDomain + 'api/claimTask'
export const searchForms = apiDomain + 'api/searchForms'
export const getNotifications = apiDomain + 'api/getNotifications'
export const readNotification = apiDomain + 'api/readNotification'
export const unclaim = apiDomain + 'api/unclaim'

export const getHeader = function () {
  const tokenData = JSON.parse(window.localStorage.getItem('authUser'))
  const headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer ' + tokenData.access_token,
    'Origin': 'http://paiworkflows.com',
    'Host': 'paiworkflows.com',
    'Access-Control-Request-Method': 'POST',
    'Access-Control-Request-Headers': 'X-Custom-Header'
  }
  return headers
}
