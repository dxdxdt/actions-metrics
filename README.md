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
Updated: 2026-04-01T19:54:24.583351+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.950 |  |
| ap-east-1 | 0.752 |  |
| ap-east-2 | 0.692 |  |
| ap-northeast-1 | 0.567 |  |
| ap-northeast-2 | 0.671 |  |
| ap-northeast-3 | 0.601 |  |
| ap-south-1 | 0.867 |  |
| ap-south-2 | 0.913 |  |
| ap-southeast-1 | 0.823 |  |
| ap-southeast-2 | 0.733 |  |
| ap-southeast-3 | 0.889 |  |
| ap-southeast-4 | 0.777 |  |
| ap-southeast-5 | 0.848 |  |
| ap-southeast-6 | 0.794 |  |
| ap-southeast-7 | 0.940 |  |
| ca-central-1 | 0.129 | 16 |
| ca-west-1 | 0.232 |  |
| eu-central-1 | 0.447 |  |
| eu-central-2 | 0.469 |  |
| eu-north-1 | 0.510 |  |
| eu-south-1 | 0.482 |  |
| eu-south-2 | 0.488 |  |
| eu-west-1 | 0.383 |  |
| eu-west-2 | 0.420 |  |
| eu-west-3 | 0.434 |  |
| il-central-1 | 0.625 |  |
| me-central-1 | 0.835 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.227 |  |
| sa-east-1 | 0.633 |  |
| us-east-1 | 0.103 | 4415 |
| us-east-2 | 0.085 | 1471 |
| us-gov-east-1 | 0.085 | 1619 |
| us-gov-west-1 | 0.247 | 190 |
| us-west-1 | 0.204 | 3332 |
| us-west-2 | 0.247 | 153 |

