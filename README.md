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
Updated: 2026-02-25T19:46:24.010487+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.009 |  |
| ap-east-1 | 0.690 |  |
| ap-east-2 | 0.631 |  |
| ap-northeast-1 | 0.510 |  |
| ap-northeast-2 | 0.617 |  |
| ap-northeast-3 | 0.534 |  |
| ap-south-1 | 0.939 |  |
| ap-south-2 | 0.942 |  |
| ap-southeast-1 | 0.760 |  |
| ap-southeast-2 | 0.671 |  |
| ap-southeast-3 | 0.817 |  |
| ap-southeast-4 | 0.710 |  |
| ap-southeast-5 | 0.782 |  |
| ap-southeast-6 | 0.705 |  |
| ap-southeast-7 | 0.862 |  |
| ca-central-1 | 0.232 | 16 |
| ca-west-1 | 0.232 |  |
| eu-central-1 | 0.514 |  |
| eu-central-2 | 0.551 |  |
| eu-north-1 | 0.568 |  |
| eu-south-1 | 0.534 |  |
| eu-south-2 | 0.556 |  |
| eu-west-1 | 0.430 |  |
| eu-west-2 | 0.484 |  |
| eu-west-3 | 0.509 |  |
| il-central-1 | 0.694 |  |
| me-central-1 | 0.896 |  |
| me-south-1 | 0.859 |  |
| mx-central-1 | 0.215 |  |
| sa-east-1 | 0.631 |  |
| us-east-1 | 0.173 | 4183 |
| us-east-2 | 0.163 | 1379 |
| us-gov-east-1 | 0.161 | 1509 |
| us-gov-west-1 | 0.172 | 162 |
| us-west-1 | 0.155 | 3118 |
| us-west-2 | 0.173 | 131 |

