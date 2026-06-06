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
Updated: 2026-06-06T06:50:15.793342+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.869 |  |
| ap-east-1 | 0.823 |  |
| ap-east-2 | 0.763 |  |
| ap-northeast-1 | 0.633 |  |
| ap-northeast-2 | 0.742 |  |
| ap-northeast-3 | 0.657 |  |
| ap-south-1 | 0.819 |  |
| ap-south-2 | 0.867 |  |
| ap-southeast-1 | 0.885 |  |
| ap-southeast-2 | 0.785 |  |
| ap-southeast-3 | 0.943 |  |
| ap-southeast-4 | 0.829 |  |
| ap-southeast-5 | 0.920 |  |
| ap-southeast-6 | 0.825 |  |
| ap-southeast-7 | 0.986 |  |
| ca-central-1 | 0.107 | 16 |
| ca-west-1 | 0.282 |  |
| eu-central-1 | 0.384 |  |
| eu-central-2 | 0.414 |  |
| eu-north-1 | 0.434 |  |
| eu-south-1 | 0.418 |  |
| eu-south-2 | 0.414 |  |
| eu-west-1 | 0.303 |  |
| eu-west-2 | 0.341 |  |
| eu-west-3 | 0.361 |  |
| il-central-1 | 0.542 |  |
| me-central-1 | 0.774 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.246 |  |
| sa-east-1 | 0.486 |  |
| us-east-1 | 0.056 | 4727 |
| us-east-2 | 0.094 | 1625 |
| us-gov-east-1 | 0.100 | 1709 |
| us-gov-west-1 | 0.318 | 196 |
| us-west-1 | 0.265 | 3636 |
| us-west-2 | 0.318 | 162 |

