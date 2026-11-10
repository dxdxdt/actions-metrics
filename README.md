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
Updated: 2026-11-10T22:05:46.431629+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.792 |  |
| ap-east-1 | 0.478 |  |
| ap-east-2 | 0.435 |  |
| ap-northeast-1 | 0.344 |  |
| ap-northeast-2 | 0.423 |  |
| ap-northeast-3 | 0.365 |  |
| ap-south-1 | 0.695 |  |
| ap-south-2 | 0.691 |  |
| ap-southeast-1 | 0.535 |  |
| ap-southeast-2 | 0.456 |  |
| ap-southeast-3 | 0.579 |  |
| ap-southeast-4 | 0.520 |  |
| ap-southeast-5 | 0.551 |  |
| ap-southeast-6 | 0.478 |  |
| ap-southeast-7 | 0.612 |  |
| ca-central-1 | 0.201 | 18 |
| ca-west-1 | 0.185 |  |
| eu-central-1 | 0.426 |  |
| eu-central-2 | 0.438 |  |
| eu-north-1 | 0.464 |  |
| eu-south-1 | 0.444 |  |
| eu-south-2 | 0.434 |  |
| eu-west-1 | 0.367 |  |
| eu-west-2 | 0.392 |  |
| eu-west-3 | 0.409 |  |
| il-central-1 | 0.549 |  |
| me-central-1 | 0.699 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.182 |  |
| sa-east-1 | 0.522 |  |
| us-east-1 | 0.184 | 5178 |
| us-east-2 | 0.143 | 1725 |
| us-gov-east-1 | 0.174 | 1959 |
| us-gov-west-1 | 0.091 | 245 |
| us-west-1 | 0.055 | 4215 |
| us-west-2 | 0.092 | 197 |

