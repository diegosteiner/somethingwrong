import { Injectable }     from '@angular/core';
import { Http, Response } from '@angular/http';
import { Headers, RequestOptions } from '@angular/http';
import {Observable} from 'rxjs/Rx';
import 'rxjs/add/operator/map';
import { Monitorizable } from './monitorizable';

@Injectable()
export class MonitorizableService {
  private monitorizablesUrl = '/apps';

  constructor (private http: Http) {}

  getMonitorizables(): Observable<Monitorizable[]> {
    return this.http.get(this.monitorizablesUrl)
                    .map(this.extractData)
                    .catch(this.handleError);
  }

  private extractData(res: Response) {
    let body = res.json();
    let data = body.data || [];
    return data.map(mon => mon.attributes);
  }

  private handleError (error: any) {
    let errMsg = (error.message) ? error.message :
      error.status ? `${error.status} - ${error.statusText}` : 'Server error';
    console.error(errMsg); // log to console instead
    return Observable.throw(errMsg);
  }
}
