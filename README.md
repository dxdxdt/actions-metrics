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
Updated: 2026-02-20T05:48:02.073709+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.962 |  |
| ap-east-1 | 0.712 |  |
| ap-east-2 | 0.653 |  |
| ap-northeast-1 | 0.534 |  |
| ap-northeast-2 | 0.647 |  |
| ap-northeast-3 | 0.566 |  |
| ap-south-1 | 0.906 |  |
| ap-south-2 | 0.915 |  |
| ap-southeast-1 | 0.789 |  |
| ap-southeast-2 | 0.698 |  |
| ap-southeast-3 | 0.845 |  |
| ap-southeast-4 | 0.738 |  |
| ap-southeast-5 | 0.808 |  |
| ap-southeast-6 | 0.786 |  |
| ap-southeast-7 | 0.893 |  |
| ca-central-1 | 0.178 | 16 |
| ca-west-1 | 0.252 |  |
| eu-central-1 | 0.479 |  |
| eu-central-2 | 0.492 |  |
| eu-north-1 | 0.525 |  |
| eu-south-1 | 0.502 |  |
| eu-south-2 | 0.511 |  |
| eu-west-1 | 0.402 |  |
| eu-west-2 | 0.430 |  |
| eu-west-3 | 0.457 |  |
| il-central-1 | 0.646 |  |
| me-central-1 | 0.853 |  |
| me-south-1 | 0.814 |  |
| mx-central-1 | 0.207 |  |
| sa-east-1 | 0.583 |  |
| us-east-1 | 0.136 | 4148 |
| us-east-2 | 0.149 | 1356 |
| us-gov-east-1 | 0.130 | 1493 |
| us-gov-west-1 | 0.200 | 158 |
| us-west-1 | 0.196 | 3085 |
| us-west-2 | 0.201 | 128 |

