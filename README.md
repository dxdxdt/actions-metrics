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
Updated: 2026-05-19T16:46:49.708555+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.951 |  |
| ap-east-1 | 0.756 |  |
| ap-east-2 | 0.700 |  |
| ap-northeast-1 | 0.579 |  |
| ap-northeast-2 | 0.682 |  |
| ap-northeast-3 | 0.605 |  |
| ap-south-1 | 0.877 |  |
| ap-south-2 | 0.975 |  |
| ap-southeast-1 | 0.829 |  |
| ap-southeast-2 | 0.740 |  |
| ap-southeast-3 | 0.883 |  |
| ap-southeast-4 | 0.780 |  |
| ap-southeast-5 | 0.845 |  |
| ap-southeast-6 | 0.775 |  |
| ap-southeast-7 | 0.930 |  |
| ca-central-1 | 0.123 | 16 |
| ca-west-1 | 0.226 |  |
| eu-central-1 | 0.463 |  |
| eu-central-2 | 0.486 |  |
| eu-north-1 | 0.489 |  |
| eu-south-1 | 0.483 |  |
| eu-south-2 | 0.488 |  |
| eu-west-1 | 0.384 |  |
| eu-west-2 | 0.414 |  |
| eu-west-3 | 0.432 |  |
| il-central-1 | 0.607 |  |
| me-central-1 | 0.829 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.203 |  |
| sa-east-1 | 0.541 |  |
| us-east-1 | 0.096 | 4663 |
| us-east-2 | 0.081 | 1603 |
| us-gov-east-1 | 0.085 | 1698 |
| us-gov-west-1 | 0.260 | 195 |
| us-west-1 | 0.202 | 3578 |
| us-west-2 | 0.259 | 158 |

