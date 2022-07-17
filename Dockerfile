FROM maven:3.5.3-jdk-8-alpine
# Set the working directory.
WORKDIR /usr/local/app
# Copy the pom.xml file from your host to your current location.
COPY pom.xml .
#maven resolves all dependencies specified in your pom.xml and it stores them in the local repository located on the layer
RUN mvn -e -B dependency:resolve
# Copy the rest of your app's source code from your host to your image filesystem.
COPY . .
COPY testng.xml .
# Run the specified command within the container.
ENTRYPOINT ["mvn"]
CMD ["clean" , "install"]
