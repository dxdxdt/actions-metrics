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
Updated: 2026-08-15T04:22:04.074890+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.978 |  |
| ap-east-1 | 0.690 |  |
| ap-east-2 | 0.629 |  |
| ap-northeast-1 | 0.513 |  |
| ap-northeast-2 | 0.619 |  |
| ap-northeast-3 | 0.542 |  |
| ap-south-1 | 0.893 |  |
| ap-south-2 | 0.922 |  |
| ap-southeast-1 | 0.766 |  |
| ap-southeast-2 | 0.659 |  |
| ap-southeast-3 | 0.823 |  |
| ap-southeast-4 | 0.704 |  |
| ap-southeast-5 | 0.787 |  |
| ap-southeast-6 | 0.698 |  |
| ap-southeast-7 | 0.869 |  |
| ca-central-1 | 0.201 | 18 |
| ca-west-1 | 0.191 |  |
| eu-central-1 | 0.498 |  |
| eu-central-2 | 0.521 |  |
| eu-north-1 | 0.547 |  |
| eu-south-1 | 0.525 |  |
| eu-south-2 | 0.530 |  |
| eu-west-1 | 0.426 |  |
| eu-west-2 | 0.464 |  |
| eu-west-3 | 0.495 |  |
| il-central-1 | 0.663 |  |
| me-central-1 | 0.873 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.195 |  |
| sa-east-1 | 0.629 |  |
| us-east-1 | 0.167 | 4998 |
| us-east-2 | 0.172 | 1679 |
| us-gov-east-1 | 0.144 | 1829 |
| us-gov-west-1 | 0.182 | 222 |
| us-west-1 | 0.126 | 3951 |
| us-west-2 | 0.186 | 177 |

