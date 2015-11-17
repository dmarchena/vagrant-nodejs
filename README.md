# vagrant-nodejs
A [Vagrant](https://www.vagrantup.com/) configuration for developing with or for Node.js

It uses Ubuntu 14.04 (Trusty Tahr) 64-bit as base box, available from [https://atlas.hashicorp.com/ubuntu/boxes/trusty64/versions/14.04/providers/virtualbox.box](https://atlas.hashicorp.com/ubuntu/boxes/trusty64/versions/14.04/providers/virtualbox.box). If you do not have this box installed on your system Vagrant will automatically download it for you the first time you run 'vagrant up'.

This configuration includes:

 * [nvm](https://github.com/creationix/nvm)
 * Node.js:
   * latest (currently 5.0.0) as default
   * 4.2
   * 0.12
   * 0.10
 * The following NPM packages installed globally: 
	 * [bower](http://bower.io)
	 * [dyson](http://webpro.github.io/dyson/)
	 * [express-generator](http://expressjs.com/es/starter/generator.html)
	 * [gulp](http://gulpjs.com/)
	 * [grunt-cli](http://gruntjs.com/)
	 * [karma-cli](http://karma-runner.github.io/)
	 * [jasmine](http://jasmine.github.io/)
 * [PhantomJS](http://phantomjs.org/) v1.9.8
 * git