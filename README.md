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
Updated: 2026-08-19T00:45:17.667685+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.010 |  |
| ap-east-1 | 0.677 |  |
| ap-east-2 | 0.619 |  |
| ap-northeast-1 | 0.499 |  |
| ap-northeast-2 | 0.602 |  |
| ap-northeast-3 | 0.527 |  |
| ap-south-1 | 0.910 |  |
| ap-south-2 | 0.922 |  |
| ap-southeast-1 | 0.752 |  |
| ap-southeast-2 | 0.646 |  |
| ap-southeast-3 | 0.810 |  |
| ap-southeast-4 | 0.688 |  |
| ap-southeast-5 | 0.772 |  |
| ap-southeast-6 | 0.674 |  |
| ap-southeast-7 | 0.856 |  |
| ca-central-1 | 0.244 | 18 |
| ca-west-1 | 0.191 |  |
| eu-central-1 | 0.526 |  |
| eu-central-2 | 0.552 |  |
| eu-north-1 | 0.576 |  |
| eu-south-1 | 0.553 |  |
| eu-south-2 | 0.567 |  |
| eu-west-1 | 0.428 |  |
| eu-west-2 | 0.498 |  |
| eu-west-3 | 0.502 |  |
| il-central-1 | 0.681 |  |
| me-central-1 | 0.889 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.203 |  |
| sa-east-1 | 0.645 |  |
| us-east-1 | 0.195 | 5019 |
| us-east-2 | 0.180 | 1680 |
| us-gov-east-1 | 0.150 | 1847 |
| us-gov-west-1 | 0.199 | 224 |
| us-west-1 | 0.111 | 3993 |
| us-west-2 | 0.199 | 182 |

