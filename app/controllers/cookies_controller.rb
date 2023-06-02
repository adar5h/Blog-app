class CookiesController < ApplicationController
    def set_cookie
        # cookies.signed[:my_cookie] = {
        #   value: 'Hello, cookies!',
        #   expires: 1.week.from_now
        @test = true
        # }
        # debugger
        # puts "<<<<<<<<<<"
        # value = cookies.signed[:my_cookie]
        # puts value
        # puts cookies.signed[:my_cookie]
        cookies.signed[:id_rb] = {value: 1, expires: 1.week.from_now, same_site: :none, secure: true }
        puts "_________________"
        # puts cookies.signed[:id_rb]
        puts "<<<<<<<<<<<<<<<<<<"

        cookies[:new_cookie] = { value: 1000, expires: 1.week.from_now, same_site: :none, secure: true }
        redirect_to root_path
      end
end
