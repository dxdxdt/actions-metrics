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
Updated: 2026-08-09T06:41:13.027495+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.934 |  |
| ap-east-1 | 0.748 |  |
| ap-east-2 | 0.683 |  |
| ap-northeast-1 | 0.565 |  |
| ap-northeast-2 | 0.669 |  |
| ap-northeast-3 | 0.591 |  |
| ap-south-1 | 0.859 |  |
| ap-south-2 | 0.923 |  |
| ap-southeast-1 | 0.832 |  |
| ap-southeast-2 | 0.713 |  |
| ap-southeast-3 | 0.883 |  |
| ap-southeast-4 | 0.757 |  |
| ap-southeast-5 | 0.841 |  |
| ap-southeast-6 | 0.777 |  |
| ap-southeast-7 | 0.925 |  |
| ca-central-1 | 0.182 | 18 |
| ca-west-1 | 0.252 |  |
| eu-central-1 | 0.447 |  |
| eu-central-2 | 0.466 |  |
| eu-north-1 | 0.494 |  |
| eu-south-1 | 0.481 |  |
| eu-south-2 | 0.478 |  |
| eu-west-1 | 0.378 |  |
| eu-west-2 | 0.408 |  |
| eu-west-3 | 0.427 |  |
| il-central-1 | 0.609 |  |
| me-central-1 | 0.855 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.223 |  |
| sa-east-1 | 0.561 |  |
| us-east-1 | 0.119 | 4959 |
| us-east-2 | 0.154 | 1677 |
| us-gov-east-1 | 0.152 | 1810 |
| us-gov-west-1 | 0.244 | 214 |
| us-west-1 | 0.186 | 3909 |
| us-west-2 | 0.244 | 175 |

