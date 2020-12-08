spec:
	gem2rpm --fetch obs_deploy > rubygem-obs_deploy.spec
	rm *.gem
spec-clean:
	spec-cleaner rubygem-obs_deploy.spec > x.spec
	mv x.spec rubygem-obs_deploy.spec
