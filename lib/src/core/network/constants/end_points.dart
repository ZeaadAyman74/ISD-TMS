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
  static const cardDetail = '/api/my/projects/{projectId}/cards/{cardId}';
  static const cardAttachments = '/api/my/projects/{projectId}/cards/{cardId}/attachments';
  static const cardAttachmentDetail = '/api/my/projects/{projectId}/cards/{cardId}/attachments/{attachmentId}';
  static const cardComments = '/api/my/projects/{projectId}/cards/{cardId}/comments';
  static const cardCommentDetail = '/api/my/projects/{projectId}/cards/{cardId}/comments/{commentId}';
  static const cardActivities = '/api/my/projects/{projectId}/cards/{cardId}/activities';

  // Lookups
  static const cardTypes = '/api/lookups/card-types';
  static const cardPriorities = '/api/lookups/card-priorities';
  static const workflowStatuses = '/api/lookups/workflow-statuses';

  // Notifications
  static const notifications = '/api/notifications';

  static const getAllProjects='/api/projects';
  //page=1&itemsPerPage=10&orderBy=created_at&orderDirection=DESC&is_active=1&search_text=&lang=en
}
