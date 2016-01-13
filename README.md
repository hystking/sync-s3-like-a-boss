# SYNC S3 LIKE A BOSS

Install aws-cli
```
pip install aws-cli
```

## To sync S3 bucket

Edit sync path and bucket
```
cp sync.sh.tamplate sync.sh
vim sync.sh
```

Run
```
./sync.sh
```

## To invalidate CloudFront

Edit CloudFront config
```
cp invalidation.sh.tamplate invalidation.sh
vim invalidation.sh
```

Run
```
./invalidation.sh
```
