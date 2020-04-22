for Y in {2020..2020}; do
	mkdir $Y
	cd $Y
	for M in {04..04}; do
		mkdir $M
		cd $M
		for D in {01..21}; do
			mkdir $D
			cd $D
			for i in {01..04}; do
				echo "/*$i on $M/$D/$Y*/" >glob.js
				echo "# $i on $M/$D/$Y" > glob.py
				echo "<! –– $i on $M/$D/$Y -->" > glob.html
				echo "/*$i on $M/$D/$Y*/" >glob.css
				export GIT_AUTHOR_NAME="koopcodes"
				export GIT_AUTHOR_EMAIL="koop@koop.codes"
				export GIT_AUTHOR_DATE="$Y-$M-$D 22:$i:00"
				export GIT_COMMITTER_NAME="koopcodes"
				export GIT_COMMITTER_EMAIL="koop@koop.codes"
				export GIT_COMMITTER_DATE="$Y-$M-$D 22:$i:00"
				git add glob.js -f
				git add glob.py -f
				git add glob.html -f
				git add glob.css -f
				git commit --date="$Y-$M-$D 22:$i:00" -m "$i on $M $D $Y"
			done
			cd ../
		done
		cd ../
	done
	cd ../
done
git push origin master
git rm -rf 20**
git rm -rf 19**
git commit -am "cleanup"
git push origin master
