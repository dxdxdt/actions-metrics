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
Updated: 2026-03-27T19:37:34.910265+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.976 |  |
| ap-east-1 | 0.723 |  |
| ap-east-2 | 0.654 |  |
| ap-northeast-1 | 0.539 |  |
| ap-northeast-2 | 0.652 |  |
| ap-northeast-3 | 0.573 |  |
| ap-south-1 | 0.871 |  |
| ap-south-2 | 0.884 |  |
| ap-southeast-1 | 0.798 |  |
| ap-southeast-2 | 0.699 |  |
| ap-southeast-3 | 0.859 |  |
| ap-southeast-4 | 0.737 |  |
| ap-southeast-5 | 0.826 |  |
| ap-southeast-6 | 0.747 |  |
| ap-southeast-7 | 0.911 |  |
| ca-central-1 | 0.206 | 16 |
| ca-west-1 | 0.236 |  |
| eu-central-1 | 0.476 |  |
| eu-central-2 | 0.503 |  |
| eu-north-1 | 0.544 |  |
| eu-south-1 | 0.510 |  |
| eu-south-2 | 0.538 |  |
| eu-west-1 | 0.407 |  |
| eu-west-2 | 0.445 |  |
| eu-west-3 | 0.457 |  |
| il-central-1 | 0.672 |  |
| me-central-1 | 0.841 |  |
| me-south-1 | 0.798 |  |
| mx-central-1 | 0.243 |  |
| sa-east-1 | 0.597 |  |
| us-east-1 | 0.148 | 4372 |
| us-east-2 | 0.161 | 1458 |
| us-gov-east-1 | 0.164 | 1609 |
| us-gov-west-1 | 0.229 | 190 |
| us-west-1 | 0.168 | 3310 |
| us-west-2 | 0.232 | 151 |

