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

  // Lookups
  static const cardTypes = '/api/lookups/card-types';
  static const cardPriorities = '/api/lookups/card-priorities';
  static const workflowStatuses = '/api/lookups/workflow-statuses';
}
