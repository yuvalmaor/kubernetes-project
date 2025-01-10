// @ts-ignore

import { HttpInterceptorFn } from "@angular/common/http";
import { environment } from "../../../environments/environment";  // Import the environment variable
// @ts-ignore

export const apiInterceptor: HttpInterceptorFn = (req, next) => {
  const apiReq = req.clone({ url: `${environment.apiUrl}${req.url}` });
  return next(apiReq);
};

