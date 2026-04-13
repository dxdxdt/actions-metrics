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
Updated: 2026-04-13T04:54:37.832261+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.982 |  |
| ap-east-1 | 0.699 |  |
| ap-east-2 | 0.634 |  |
| ap-northeast-1 | 0.523 |  |
| ap-northeast-2 | 0.627 |  |
| ap-northeast-3 | 0.544 |  |
| ap-south-1 | 0.899 |  |
| ap-south-2 | 0.895 |  |
| ap-southeast-1 | 0.781 |  |
| ap-southeast-2 | 0.688 |  |
| ap-southeast-3 | 0.835 |  |
| ap-southeast-4 | 0.721 |  |
| ap-southeast-5 | 0.797 |  |
| ap-southeast-6 | 0.723 |  |
| ap-southeast-7 | 0.875 |  |
| ca-central-1 | 0.222 | 16 |
| ca-west-1 | 0.260 |  |
| eu-central-1 | 0.491 |  |
| eu-central-2 | 0.514 |  |
| eu-north-1 | 0.542 |  |
| eu-south-1 | 0.516 |  |
| eu-south-2 | 0.518 |  |
| eu-west-1 | 0.409 |  |
| eu-west-2 | 0.450 |  |
| eu-west-3 | 0.471 |  |
| il-central-1 | 0.656 |  |
| me-central-1 | 0.866 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.224 |  |
| sa-east-1 | 0.603 |  |
| us-east-1 | 0.160 | 4491 |
| us-east-2 | 0.176 | 1497 |
| us-gov-east-1 | 0.168 | 1646 |
| us-gov-west-1 | 0.206 | 192 |
| us-west-1 | 0.150 | 3405 |
| us-west-2 | 0.204 | 155 |

