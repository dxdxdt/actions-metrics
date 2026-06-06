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
Updated: 2026-06-06T17:02:48.823355+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.982 |  |
| ap-east-1 | 0.695 |  |
| ap-east-2 | 0.629 |  |
| ap-northeast-1 | 0.514 |  |
| ap-northeast-2 | 0.618 |  |
| ap-northeast-3 | 0.541 |  |
| ap-south-1 | 0.893 |  |
| ap-south-2 | 0.917 |  |
| ap-southeast-1 | 0.770 |  |
| ap-southeast-2 | 0.678 |  |
| ap-southeast-3 | 0.830 |  |
| ap-southeast-4 | 0.722 |  |
| ap-southeast-5 | 0.790 |  |
| ap-southeast-6 | 0.717 |  |
| ap-southeast-7 | 0.875 |  |
| ca-central-1 | 0.226 | 16 |
| ca-west-1 | 0.224 |  |
| eu-central-1 | 0.494 |  |
| eu-central-2 | 0.514 |  |
| eu-north-1 | 0.535 |  |
| eu-south-1 | 0.530 |  |
| eu-south-2 | 0.532 |  |
| eu-west-1 | 0.421 |  |
| eu-west-2 | 0.448 |  |
| eu-west-3 | 0.487 |  |
| il-central-1 | 0.657 |  |
| me-central-1 | 0.879 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.211 |  |
| sa-east-1 | 0.618 |  |
| us-east-1 | 0.154 | 4729 |
| us-east-2 | 0.145 | 1626 |
| us-gov-east-1 | 0.156 | 1709 |
| us-gov-west-1 | 0.197 | 197 |
| us-west-1 | 0.148 | 3637 |
| us-west-2 | 0.197 | 162 |

