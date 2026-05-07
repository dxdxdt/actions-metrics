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
Updated: 2026-05-07T22:00:23.181870+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.998 |  |
| ap-east-1 | 0.703 |  |
| ap-east-2 | 0.635 |  |
| ap-northeast-1 | 0.524 |  |
| ap-northeast-2 | 0.631 |  |
| ap-northeast-3 | 0.551 |  |
| ap-south-1 | 0.876 |  |
| ap-south-2 | 0.885 |  |
| ap-southeast-1 | 0.777 |  |
| ap-southeast-2 | 0.670 |  |
| ap-southeast-3 | 0.829 |  |
| ap-southeast-4 | 0.714 |  |
| ap-southeast-5 | 0.802 |  |
| ap-southeast-6 | 0.723 |  |
| ap-southeast-7 | 0.887 |  |
| ca-central-1 | 0.212 | 16 |
| ca-west-1 | 0.210 |  |
| eu-central-1 | 0.506 |  |
| eu-central-2 | 0.529 |  |
| eu-north-1 | 0.541 |  |
| eu-south-1 | 0.535 |  |
| eu-south-2 | 0.548 |  |
| eu-west-1 | 0.426 |  |
| eu-west-2 | 0.476 |  |
| eu-west-3 | 0.490 |  |
| il-central-1 | 0.658 |  |
| me-central-1 | 0.861 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.239 |  |
| sa-east-1 | 0.623 |  |
| us-east-1 | 0.171 | 4609 |
| us-east-2 | 0.149 | 1572 |
| us-gov-east-1 | 0.168 | 1680 |
| us-gov-west-1 | 0.188 | 194 |
| us-west-1 | 0.145 | 3538 |
| us-west-2 | 0.191 | 157 |

