# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  Morris.Line
    element: 'graph'
    data: [
      {y: '2014', a: 2500}
      {y: '2015', a: 2400}
      {y: '2016', a: 2300}
      {y: '2017', a: 2200}
      {y: '2018', a: 2300}
      {y: '2019', a: 2400}
    ]
    xkey: 'y'
    ykeys: ['a']
    labels: ['Price']