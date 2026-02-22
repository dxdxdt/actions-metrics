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
Updated: 2026-02-22T11:15:50.969792+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.027 |  |
| ap-east-1 | 0.684 |  |
| ap-east-2 | 0.617 |  |
| ap-northeast-1 | 0.506 |  |
| ap-northeast-2 | 0.608 |  |
| ap-northeast-3 | 0.525 |  |
| ap-south-1 | 0.902 |  |
| ap-south-2 | 0.895 |  |
| ap-southeast-1 | 0.761 |  |
| ap-southeast-2 | 0.664 |  |
| ap-southeast-3 | 0.817 |  |
| ap-southeast-4 | 0.702 |  |
| ap-southeast-5 | 0.780 |  |
| ap-southeast-6 | 0.723 |  |
| ap-southeast-7 | 0.865 |  |
| ca-central-1 | 0.231 | 16 |
| ca-west-1 | 0.214 |  |
| eu-central-1 | 0.525 |  |
| eu-central-2 | 0.524 |  |
| eu-north-1 | 0.574 |  |
| eu-south-1 | 0.560 |  |
| eu-south-2 | 0.555 |  |
| eu-west-1 | 0.446 |  |
| eu-west-2 | 0.479 |  |
| eu-west-3 | 0.486 |  |
| il-central-1 | 0.710 |  |
| me-central-1 | 0.915 |  |
| me-south-1 | 0.851 |  |
| mx-central-1 | 0.253 |  |
| sa-east-1 | 0.629 |  |
| us-east-1 | 0.175 | 4161 |
| us-east-2 | 0.167 | 1370 |
| us-gov-east-1 | 0.167 | 1499 |
| us-gov-west-1 | 0.180 | 160 |
| us-west-1 | 0.146 | 3097 |
| us-west-2 | 0.184 | 129 |

