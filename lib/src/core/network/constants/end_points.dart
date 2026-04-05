class EndPoints {
  static const baseUrl = 'https://api.tms.isdeg.com';

  // Auth
  static const login = '/api/auth/login';
  static const authCheck = '/api/auth/check';
  static const logout = '/api/auth/logout';

  // Projects
  static const myProjects = '/api/my/projects';

  // Board
  static const projectBoard = '/api/my/projects/{projectId}/board';

  // Cards
  static const createCard = '/api/my/projects/{projectId}/cards';
  static const updateCard = '/api/my/projects/{projectId}/cards/{cardId}';
  static const cardAttachments = '/api/my/projects/{projectId}/cards/{cardId}/attachments';
  static const deleteAttachment = '/api/my/projects/{projectId}/cards/{cardId}/attachments/{attachmentId}';
  static const cardComments = '/api/my/projects/{projectId}/cards/{cardId}/comments';
  static const deleteComment = '/api/my/projects/{projectId}/cards/{cardId}/comments/{commentId}';
  static const cardActivities = '/api/my/projects/{projectId}/cards/{cardId}/activities';
  static const reorderCards='/api/my/projects/{projectId}/lists/{listId}/cards/reorder';

  // Lookups
  static const cardTypes = '/api/lookups/card-types';
  static const cardPriorities = '/api/lookups/card-priorities';
  static const workflowStatuses = '/api/lookups/workflow-statuses';

  // Notifications
  static const notifications = '/api/notifications';

  // Project Members
  static const projectRoles='/api/lookups/project-roles';
  static const searchProjectMembers='/api/my/projects/{projectId}/search-users'; //?search_text=Zi
  static const addProjectMember='/api/my/projects/{projectId}/members'; //{user_id: 2, role: "member"}
  static const deleteProjectMember='/api/my/projects/{projectId}/members'; //{user_id: 2}
  static const changeMemberRole='/api/my/projects/{projectId}/members/role'; // PATCH {user_id: 14, role: "member"}
  static const transferOwnership='/api/my/projects/{projectId}/transfer-ownership'; //{user_id: 14}

  // Management
  static const getAllProjects='/api/projects';
}
