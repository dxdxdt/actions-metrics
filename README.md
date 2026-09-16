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
Updated: 2026-09-16T17:53:59.504178+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.016 |  |
| ap-east-1 | 0.672 |  |
| ap-east-2 | 0.610 |  |
| ap-northeast-1 | 0.492 |  |
| ap-northeast-2 | 0.599 |  |
| ap-northeast-3 | 0.519 |  |
| ap-south-1 | 0.896 |  |
| ap-south-2 | 0.903 |  |
| ap-southeast-1 | 0.772 |  |
| ap-southeast-2 | 0.633 |  |
| ap-southeast-3 | 0.802 |  |
| ap-southeast-4 | 0.679 |  |
| ap-southeast-5 | 0.769 |  |
| ap-southeast-6 | 0.672 |  |
| ap-southeast-7 | 0.854 |  |
| ca-central-1 | 0.245 | 18 |
| ca-west-1 | 0.227 |  |
| eu-central-1 | 0.537 |  |
| eu-central-2 | 0.556 |  |
| eu-north-1 | 0.606 |  |
| eu-south-1 | 0.561 |  |
| eu-south-2 | 0.577 |  |
| eu-west-1 | 0.469 |  |
| eu-west-2 | 0.497 |  |
| eu-west-3 | 0.516 |  |
| il-central-1 | 0.704 |  |
| me-central-1 | 0.953 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.231 |  |
| sa-east-1 | 0.645 |  |
| us-east-1 | 0.209 | 5102 |
| us-east-2 | 0.214 | 1686 |
| us-gov-east-1 | 0.203 | 1914 |
| us-gov-west-1 | 0.164 | 233 |
| us-west-1 | 0.104 | 4118 |
| us-west-2 | 0.165 | 192 |

