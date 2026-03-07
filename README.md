# Github Actions Metrics
Information on Github hosted runners like the Azure region they run on is
necessary info when optimising CD/CI pipelines(especially network latencies and
route path bandwidth). Github does not disclose it so I did it myself.

Using this info, place the resources(DB, object storage, other instances) near
the runners are usually run.

A few pieces of info I could gather online:

- Azure doesn't provide a list of VM service endpoints like AWS
- Github-hosted Actions runners are actually Azure VMs (surprisingly, not in a
  container)
- Github is hosted in the data centre somewhere in the US, probably in the same
  data centre where Azure is present

Microsoft definitely has more points of presence than any other cloud service
providers, but there's no official list of data center endpoints to ping. If you
look at the map,

<a href="https://aws.amazon.com/about-aws/global-infrastructure/regions_az/">
<img src="image.png" style="width: 500px;">
</a>
<a href="https://datacenters.microsoft.com/globe/explore">
<img src="image-1.png" style="width: 500px;">
</a>

they're close enough. For most devs, all that matters is probably how close
their S3 buckets are to the Github Actions runners. Some AWS and Azure regions
are under the same roof, but then again, no official data.

## DATA
Updated: 2026-03-07T18:23:29.938872+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.917 |  |
| ap-east-1 | 0.765 |  |
| ap-east-2 | 0.715 |  |
| ap-northeast-1 | 0.588 |  |
| ap-northeast-2 | 0.701 |  |
| ap-northeast-3 | 0.617 |  |
| ap-south-1 | 0.873 |  |
| ap-south-2 | 0.921 |  |
| ap-southeast-1 | 0.839 |  |
| ap-southeast-2 | 0.757 |  |
| ap-southeast-3 | 0.896 |  |
| ap-southeast-4 | 0.792 |  |
| ap-southeast-5 | 0.860 |  |
| ap-southeast-6 | 0.809 |  |
| ap-southeast-7 | 0.944 |  |
| ca-central-1 | 0.125 | 16 |
| ca-west-1 | 0.252 |  |
| eu-central-1 | 0.425 |  |
| eu-central-2 | 0.452 |  |
| eu-north-1 | 0.469 |  |
| eu-south-1 | 0.452 |  |
| eu-south-2 | 0.463 |  |
| eu-west-1 | 0.338 |  |
| eu-west-2 | 0.380 |  |
| eu-west-3 | 0.406 |  |
| il-central-1 | 0.599 |  |
| me-central-1 | 0.803 |  |
| me-south-1 | 0.760 |  |
| mx-central-1 | 0.229 |  |
| sa-east-1 | 0.525 |  |
| us-east-1 | 0.090 | 4236 |
| us-east-2 | 0.101 | 1407 |
| us-gov-east-1 | 0.097 | 1539 |
| us-gov-west-1 | 0.252 | 174 |
| us-west-1 | 0.235 | 3191 |
| us-west-2 | 0.254 | 143 |

