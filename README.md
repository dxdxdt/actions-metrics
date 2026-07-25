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
Updated: 2026-07-25T00:03:25.978494+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.941 |  |
| ap-east-1 | 0.753 |  |
| ap-east-2 | 0.692 |  |
| ap-northeast-1 | 0.574 |  |
| ap-northeast-2 | 0.674 |  |
| ap-northeast-3 | 0.600 |  |
| ap-south-1 | 0.867 |  |
| ap-south-2 | 0.894 |  |
| ap-southeast-1 | 0.831 |  |
| ap-southeast-2 | 0.730 |  |
| ap-southeast-3 | 0.881 |  |
| ap-southeast-4 | 0.770 |  |
| ap-southeast-5 | 0.849 |  |
| ap-southeast-6 | 0.758 |  |
| ap-southeast-7 | 0.934 |  |
| ca-central-1 | 0.180 | 16 |
| ca-west-1 | 0.247 |  |
| eu-central-1 | 0.462 |  |
| eu-central-2 | 0.481 |  |
| eu-north-1 | 0.518 |  |
| eu-south-1 | 0.482 |  |
| eu-south-2 | 0.492 |  |
| eu-west-1 | 0.383 |  |
| eu-west-2 | 0.421 |  |
| eu-west-3 | 0.442 |  |
| il-central-1 | 0.622 |  |
| me-central-1 | 0.849 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.227 |  |
| sa-east-1 | 0.561 |  |
| us-east-1 | 0.126 | 4906 |
| us-east-2 | 0.146 | 1662 |
| us-gov-east-1 | 0.145 | 1777 |
| us-gov-west-1 | 0.255 | 206 |
| us-west-1 | 0.196 | 3829 |
| us-west-2 | 0.260 | 170 |

