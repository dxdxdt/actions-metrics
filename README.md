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
Updated: 2026-08-24T07:51:54.685930+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.000 |  |
| ap-east-1 | 0.672 |  |
| ap-east-2 | 0.607 |  |
| ap-northeast-1 | 0.492 |  |
| ap-northeast-2 | 0.603 |  |
| ap-northeast-3 | 0.518 |  |
| ap-south-1 | 0.916 |  |
| ap-south-2 | 0.927 |  |
| ap-southeast-1 | 0.750 |  |
| ap-southeast-2 | 0.646 |  |
| ap-southeast-3 | 0.802 |  |
| ap-southeast-4 | 0.692 |  |
| ap-southeast-5 | 0.769 |  |
| ap-southeast-6 | 0.679 |  |
| ap-southeast-7 | 0.849 |  |
| ca-central-1 | 0.248 | 18 |
| ca-west-1 | 0.232 |  |
| eu-central-1 | 0.514 |  |
| eu-central-2 | 0.541 |  |
| eu-north-1 | 0.566 |  |
| eu-south-1 | 0.542 |  |
| eu-south-2 | 0.553 |  |
| eu-west-1 | 0.443 |  |
| eu-west-2 | 0.481 |  |
| eu-west-3 | 0.496 |  |
| il-central-1 | 0.671 |  |
| me-central-1 | 0.908 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.195 |  |
| sa-east-1 | 0.639 |  |
| us-east-1 | 0.191 | 5051 |
| us-east-2 | 0.204 | 1682 |
| us-gov-east-1 | 0.202 | 1877 |
| us-gov-west-1 | 0.181 | 226 |
| us-west-1 | 0.116 | 4044 |
| us-west-2 | 0.181 | 185 |

