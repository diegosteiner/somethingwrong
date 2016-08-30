import { Component, OnInit } from '@angular/core';
import { Monitorizable } from './monitorizable';
import { MonitorizableService } from './monitorizable.service';

@Component({
  selector: 'my-app',
  template: `
  <h1>{{title}}</h1>
  <div class="help"></div>
  <ul id="apps">
  <li *ngFor="let mon_vm of monitorizable_view_models" 
  class="app" 
  (click)="toggleMonitorizable(mon_vm)"
  [attr.data-app-id]="mon_vm.id" 
  [class.ok]="mon_vm.ok"
  [class.not_ok]="!mon_vm.ok"
  >
  <header>
  <h2>{{ mon_vm.name }}</h2>
  <div class="health"></div>
  </header>
  <main>
  <ul class="problems"></ul>
  <div class="actions">
  <button class="solve">✓ Solve Problems</button>
  </div>
  </main>
  </li>
  </ul>
  `,
  providers: [ MonitorizableService ]
})
export class AppComponent implements OnInit { 
  title = 'Something wrong';
  monitorizable_view_models;
  errorMessage;

  constructor (private monitorizableService: MonitorizableService) {}

  ngOnInit() { this.getMonitorizableViewModels(); }

  getMonitorizableViewModels() {
    this.monitorizableService.getMonitorizables()
    .subscribe(
      monitorizables => this.monitorizable_view_models = monitorizables,
        error =>  this.errorMessage = <any>error
    );
  }

  toggleMonitorizable(monitorizable_vm) { 
    monitorizable_vm.selected = !monitorizable_vm.selected;
  }
}

