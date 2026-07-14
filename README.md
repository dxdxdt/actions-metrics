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
Updated: 2026-07-14T13:14:16.865936+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.898 |  |
| ap-east-1 | 0.785 |  |
| ap-east-2 | 0.727 |  |
| ap-northeast-1 | 0.606 |  |
| ap-northeast-2 | 0.717 |  |
| ap-northeast-3 | 0.631 |  |
| ap-south-1 | 0.877 |  |
| ap-south-2 | 1.003 |  |
| ap-southeast-1 | 0.858 |  |
| ap-southeast-2 | 0.763 |  |
| ap-southeast-3 | 0.917 |  |
| ap-southeast-4 | 0.803 |  |
| ap-southeast-5 | 0.881 |  |
| ap-southeast-6 | 0.793 |  |
| ap-southeast-7 | 0.973 |  |
| ca-central-1 | 0.115 | 16 |
| ca-west-1 | 0.254 |  |
| eu-central-1 | 0.419 |  |
| eu-central-2 | 0.448 |  |
| eu-north-1 | 0.475 |  |
| eu-south-1 | 0.458 |  |
| eu-south-2 | 0.461 |  |
| eu-west-1 | 0.348 |  |
| eu-west-2 | 0.385 |  |
| eu-west-3 | 0.404 |  |
| il-central-1 | 0.579 |  |
| me-central-1 | 0.791 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.227 |  |
| sa-east-1 | 0.528 |  |
| us-east-1 | 0.074 | 4869 |
| us-east-2 | 0.088 | 1656 |
| us-gov-east-1 | 0.084 | 1748 |
| us-gov-west-1 | 0.284 | 202 |
| us-west-1 | 0.233 | 3775 |
| us-west-2 | 0.283 | 165 |

