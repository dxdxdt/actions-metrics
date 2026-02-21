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
Updated: 2026-02-21T07:27:56.959986+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.964 |  |
| ap-east-1 | 0.752 |  |
| ap-east-2 | 0.697 |  |
| ap-northeast-1 | 0.562 |  |
| ap-northeast-2 | 0.685 |  |
| ap-northeast-3 | 0.589 |  |
| ap-south-1 | 0.863 |  |
| ap-south-2 | 0.907 |  |
| ap-southeast-1 | 0.816 |  |
| ap-southeast-2 | 0.734 |  |
| ap-southeast-3 | 0.883 |  |
| ap-southeast-4 | 0.774 |  |
| ap-southeast-5 | 0.847 |  |
| ap-southeast-6 | 0.774 |  |
| ap-southeast-7 | 0.921 |  |
| ca-central-1 | 0.174 | 16 |
| ca-west-1 | 0.236 |  |
| eu-central-1 | 0.453 |  |
| eu-central-2 | 0.476 |  |
| eu-north-1 | 0.506 |  |
| eu-south-1 | 0.490 |  |
| eu-south-2 | 0.496 |  |
| eu-west-1 | 0.371 |  |
| eu-west-2 | 0.415 |  |
| eu-west-3 | 0.442 |  |
| il-central-1 | 0.633 |  |
| me-central-1 | 0.854 |  |
| me-south-1 | 0.809 |  |
| mx-central-1 | 0.240 |  |
| sa-east-1 | 0.561 |  |
| us-east-1 | 0.118 | 4157 |
| us-east-2 | 0.124 | 1359 |
| us-gov-east-1 | 0.132 | 1496 |
| us-gov-west-1 | 0.258 | 160 |
| us-west-1 | 0.204 | 3090 |
| us-west-2 | 0.258 | 129 |

