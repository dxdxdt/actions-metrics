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
Updated: 2026-05-17T22:45:30.266482+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.955 |  |
| ap-east-1 | 0.744 |  |
| ap-east-2 | 0.672 |  |
| ap-northeast-1 | 0.556 |  |
| ap-northeast-2 | 0.664 |  |
| ap-northeast-3 | 0.584 |  |
| ap-south-1 | 0.865 |  |
| ap-south-2 | 0.878 |  |
| ap-southeast-1 | 0.816 |  |
| ap-southeast-2 | 0.711 |  |
| ap-southeast-3 | 0.867 |  |
| ap-southeast-4 | 0.754 |  |
| ap-southeast-5 | 0.836 |  |
| ap-southeast-6 | 0.758 |  |
| ap-southeast-7 | 0.913 |  |
| ca-central-1 | 0.207 | 16 |
| ca-west-1 | 0.253 |  |
| eu-central-1 | 0.465 |  |
| eu-central-2 | 0.490 |  |
| eu-north-1 | 0.502 |  |
| eu-south-1 | 0.485 |  |
| eu-south-2 | 0.496 |  |
| eu-west-1 | 0.377 |  |
| eu-west-2 | 0.432 |  |
| eu-west-3 | 0.438 |  |
| il-central-1 | 0.624 |  |
| me-central-1 | 0.829 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.235 |  |
| sa-east-1 | 0.578 |  |
| us-east-1 | 0.139 | 4659 |
| us-east-2 | 0.161 | 1598 |
| us-gov-east-1 | 0.149 | 1697 |
| us-gov-west-1 | 0.245 | 195 |
| us-west-1 | 0.183 | 3573 |
| us-west-2 | 0.245 | 158 |

