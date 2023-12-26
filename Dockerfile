FROM ruby:2.7.2-alpine

# throw errors if Gemfile has been modified since Gemfile.lock
# RUN bundle config --global frozen 1

WORKDIR /usr/src/app

# COPY Gemfile Gemfile.lock ./

RUN apk add --no-cache build-base libffi-dev tzdata curl libpq shared-mime-info imagemagick ghostscript-fonts
RUN apk add --update --no-cache \
    libgcc libstdc++ libx11 glib libxrender libxext libintl postgresql-dev

RUN apk --update add less

# # On alpine static compiled patched qt headless wkhtmltopdf (46.8 MB).
# # Compilation took place in Travis CI with auto push to Docker Hub see
# # BUILD_LOG env. Checksum is printed in line 13685.
# COPY --from=madnight/alpine-wkhtmltopdf-builder:0.12.5-alpine3.10-606718795 \
#     /bin/wkhtmltopdf /bin/wkhtmltopdf

# RUN bundle install
# RUN bundle install --without development test

# ADD https://github.com/ufoscout/docker-compose-wait/releases/download/2.7.3/wait /wait
# RUN chmod +x /wait

# #wicked_pdf gem installs its own broken wkhtmltopdf
# RUN rm /usr/local/bundle/bin/wkhtmltopdf

COPY . .

# CMD rails server -b 0.0.0.0
