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
Updated: 2026-03-05T20:30:56.272311+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.966 |  |
| ap-east-1 | 0.726 |  |
| ap-east-2 | 0.665 |  |
| ap-northeast-1 | 0.545 |  |
| ap-northeast-2 | 0.653 |  |
| ap-northeast-3 | 0.576 |  |
| ap-south-1 | 0.879 |  |
| ap-south-2 | 0.899 |  |
| ap-southeast-1 | 0.802 |  |
| ap-southeast-2 | 0.697 |  |
| ap-southeast-3 | 0.867 |  |
| ap-southeast-4 | 0.737 |  |
| ap-southeast-5 | 0.818 |  |
| ap-southeast-6 | 0.740 |  |
| ap-southeast-7 | 0.905 |  |
| ca-central-1 | 0.191 | 16 |
| ca-west-1 | 0.226 |  |
| eu-central-1 | 0.478 |  |
| eu-central-2 | 0.492 |  |
| eu-north-1 | 0.530 |  |
| eu-south-1 | 0.502 |  |
| eu-south-2 | 0.520 |  |
| eu-west-1 | 0.401 |  |
| eu-west-2 | 0.435 |  |
| eu-west-3 | 0.465 |  |
| il-central-1 | 0.642 |  |
| me-central-1 | 0.858 |  |
| me-south-1 | 0.827 |  |
| mx-central-1 | 0.243 |  |
| sa-east-1 | 0.599 |  |
| us-east-1 | 0.143 | 4226 |
| us-east-2 | 0.143 | 1401 |
| us-gov-east-1 | 0.159 | 1532 |
| us-gov-west-1 | 0.214 | 172 |
| us-west-1 | 0.178 | 3177 |
| us-west-2 | 0.217 | 141 |

