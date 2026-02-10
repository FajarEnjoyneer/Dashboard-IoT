find grafana/public/build/ -name "*.js" -exec sed -i 's|AppTitle="Grafana"|AppTitle="Optimaxx"|g' {} \;
find grafana/public/build/ -name "*.js" -exec sed -i 's|LoginTitle="Welcome to Grafana"|LoginTitle="Welcome to Dashboard IIoT"|g' {} \;


sed -i 's|LoginTitle="Welcome to Grafana"|LoginTitle="Business Suite for Grafana"|g' {} \;