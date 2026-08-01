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
Updated: 2026-08-01T21:46:20.480311+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.928 |  |
| ap-east-1 | 0.756 |  |
| ap-east-2 | 0.701 |  |
| ap-northeast-1 | 0.584 |  |
| ap-northeast-2 | 0.681 |  |
| ap-northeast-3 | 0.604 |  |
| ap-south-1 | 0.882 |  |
| ap-south-2 | 0.945 |  |
| ap-southeast-1 | 0.836 |  |
| ap-southeast-2 | 0.730 |  |
| ap-southeast-3 | 0.891 |  |
| ap-southeast-4 | 0.774 |  |
| ap-southeast-5 | 0.853 |  |
| ap-southeast-6 | 0.766 |  |
| ap-southeast-7 | 0.932 |  |
| ca-central-1 | 0.139 | 17 |
| ca-west-1 | 0.246 |  |
| eu-central-1 | 0.426 |  |
| eu-central-2 | 0.454 |  |
| eu-north-1 | 0.483 |  |
| eu-south-1 | 0.464 |  |
| eu-south-2 | 0.471 |  |
| eu-west-1 | 0.381 |  |
| eu-west-2 | 0.397 |  |
| eu-west-3 | 0.407 |  |
| il-central-1 | 0.601 |  |
| me-central-1 | 0.816 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.199 |  |
| sa-east-1 | 0.570 |  |
| us-east-1 | 0.109 | 4931 |
| us-east-2 | 0.107 | 1673 |
| us-gov-east-1 | 0.093 | 1793 |
| us-gov-west-1 | 0.255 | 209 |
| us-west-1 | 0.197 | 3867 |
| us-west-2 | 0.254 | 172 |

