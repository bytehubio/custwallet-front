# README

1. Install RVM (ruby version manager)

```sh
curl -sSL https://get.rvm.io | bash -s stable
```

2. Install Ruby

```sh
rvm install 3.3.4 --with-openssl-dir=`brew --prefix openssl@3` --default
```

3. Install Bundler

```sh
gem install bundler
```

4. Install dependencies

```sh
bundle install
```

5. Install Yarn

```sh
npm install yarn
```

6. Install js dependencies

```sh
yarn install
```

7. Install js dependencies

```sh
yarn add postcss-cli --dev
```

8. Run the app

```sh
bin/dev
```