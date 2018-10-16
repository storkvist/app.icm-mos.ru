/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb

import * as Sentry from '@sentry/browser';
Sentry.init({
  dsn: 'https://2c6e7aef24fc465f9c7e5fa337c6a1f4:459eff10498646bc9f8b85ff4e8ba11c@sentry.io/1302267'
});

import Rails from 'rails-ujs';
Rails.start();

import Turbolinks from 'turbolinks';
Turbolinks.start();

import { Application } from 'stimulus';
import { definitionsFromContext } from 'stimulus/webpack-helpers';

const application = Application.start();
const context = require.context('controllers', true, /.js$/);
application.load(definitionsFromContext(context));

import 'design';
import 'images';
