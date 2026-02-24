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
Updated: 2026-02-24T23:24:45.346929+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.979 |  |
| ap-east-1 | 0.712 |  |
| ap-east-2 | 0.655 |  |
| ap-northeast-1 | 0.543 |  |
| ap-northeast-2 | 0.647 |  |
| ap-northeast-3 | 0.562 |  |
| ap-south-1 | 0.857 |  |
| ap-south-2 | 0.891 |  |
| ap-southeast-1 | 0.803 |  |
| ap-southeast-2 | 0.694 |  |
| ap-southeast-3 | 0.847 |  |
| ap-southeast-4 | 0.733 |  |
| ap-southeast-5 | 0.811 |  |
| ap-southeast-6 | 0.730 |  |
| ap-southeast-7 | 0.887 |  |
| ca-central-1 | 0.188 | 16 |
| ca-west-1 | 0.213 |  |
| eu-central-1 | 0.488 |  |
| eu-central-2 | 0.509 |  |
| eu-north-1 | 0.536 |  |
| eu-south-1 | 0.512 |  |
| eu-south-2 | 0.531 |  |
| eu-west-1 | 0.409 |  |
| eu-west-2 | 0.449 |  |
| eu-west-3 | 0.474 |  |
| il-central-1 | 0.673 |  |
| me-central-1 | 0.864 |  |
| me-south-1 | 0.826 |  |
| mx-central-1 | 0.227 |  |
| sa-east-1 | 0.597 |  |
| us-east-1 | 0.134 | 4179 |
| us-east-2 | 0.113 | 1378 |
| us-gov-east-1 | 0.117 | 1504 |
| us-gov-west-1 | 0.193 | 161 |
| us-west-1 | 0.185 | 3115 |
| us-west-2 | 0.190 | 130 |

