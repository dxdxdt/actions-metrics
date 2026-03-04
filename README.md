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
Updated: 2026-03-04T04:02:51.692706+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.018 |  |
| ap-east-1 | 0.673 |  |
| ap-east-2 | 0.619 |  |
| ap-northeast-1 | 0.494 |  |
| ap-northeast-2 | 0.599 |  |
| ap-northeast-3 | 0.520 |  |
| ap-south-1 | 0.951 |  |
| ap-south-2 | 0.938 |  |
| ap-southeast-1 | 0.746 |  |
| ap-southeast-2 | 0.688 |  |
| ap-southeast-3 | 0.802 |  |
| ap-southeast-4 | 0.691 |  |
| ap-southeast-5 | 0.766 |  |
| ap-southeast-6 | 0.690 |  |
| ap-southeast-7 | 0.849 |  |
| ca-central-1 | 0.229 | 16 |
| ca-west-1 | 0.220 |  |
| eu-central-1 | 0.531 |  |
| eu-central-2 | 0.550 |  |
| eu-north-1 | 0.597 |  |
| eu-south-1 | 0.555 |  |
| eu-south-2 | 0.575 |  |
| eu-west-1 | 0.453 |  |
| eu-west-2 | 0.496 |  |
| eu-west-3 | 0.514 |  |
| il-central-1 | 0.728 |  |
| me-central-1 | 0.897 |  |
| me-south-1 | 0.867 |  |
| mx-central-1 | 0.211 |  |
| sa-east-1 | 0.629 |  |
| us-east-1 | 0.190 | 4214 |
| us-east-2 | 0.167 | 1397 |
| us-gov-east-1 | 0.161 | 1527 |
| us-gov-west-1 | 0.154 | 169 |
| us-west-1 | 0.144 | 3168 |
| us-west-2 | 0.150 | 139 |

