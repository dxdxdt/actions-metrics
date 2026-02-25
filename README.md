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
Updated: 2026-02-25T10:43:03.031862+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.979 |  |
| ap-east-1 | 0.699 |  |
| ap-east-2 | 0.629 |  |
| ap-northeast-1 | 0.512 |  |
| ap-northeast-2 | 0.619 |  |
| ap-northeast-3 | 0.536 |  |
| ap-south-1 | 0.913 |  |
| ap-south-2 | 0.912 |  |
| ap-southeast-1 | 0.772 |  |
| ap-southeast-2 | 0.670 |  |
| ap-southeast-3 | 0.834 |  |
| ap-southeast-4 | 0.712 |  |
| ap-southeast-5 | 0.792 |  |
| ap-southeast-6 | 0.721 |  |
| ap-southeast-7 | 0.883 |  |
| ca-central-1 | 0.219 | 16 |
| ca-west-1 | 0.226 |  |
| eu-central-1 | 0.501 |  |
| eu-central-2 | 0.531 |  |
| eu-north-1 | 0.544 |  |
| eu-south-1 | 0.523 |  |
| eu-south-2 | 0.526 |  |
| eu-west-1 | 0.433 |  |
| eu-west-2 | 0.462 |  |
| eu-west-3 | 0.474 |  |
| il-central-1 | 0.684 |  |
| me-central-1 | 0.896 |  |
| me-south-1 | 0.847 |  |
| mx-central-1 | 0.222 |  |
| sa-east-1 | 0.607 |  |
| us-east-1 | 0.172 | 4180 |
| us-east-2 | 0.166 | 1379 |
| us-gov-east-1 | 0.166 | 1508 |
| us-gov-west-1 | 0.195 | 161 |
| us-west-1 | 0.148 | 3117 |
| us-west-2 | 0.200 | 130 |

