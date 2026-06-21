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
Updated: 2026-06-21T19:19:00.357885+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.006 |  |
| ap-east-1 | 0.666 |  |
| ap-east-2 | 0.601 |  |
| ap-northeast-1 | 0.483 |  |
| ap-northeast-2 | 0.589 |  |
| ap-northeast-3 | 0.512 |  |
| ap-south-1 | 0.901 |  |
| ap-south-2 | 0.885 |  |
| ap-southeast-1 | 0.750 |  |
| ap-southeast-2 | 0.631 |  |
| ap-southeast-3 | 0.805 |  |
| ap-southeast-4 | 0.672 |  |
| ap-southeast-5 | 0.763 |  |
| ap-southeast-6 | 0.669 |  |
| ap-southeast-7 | 0.857 |  |
| ca-central-1 | 0.264 | 16 |
| ca-west-1 | 0.224 |  |
| eu-central-1 | 0.533 |  |
| eu-central-2 | 0.566 |  |
| eu-north-1 | 0.578 |  |
| eu-south-1 | 0.591 |  |
| eu-south-2 | 0.562 |  |
| eu-west-1 | 0.455 |  |
| eu-west-2 | 0.503 |  |
| eu-west-3 | 0.510 |  |
| il-central-1 | 0.688 |  |
| me-central-1 | 0.930 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.234 |  |
| sa-east-1 | 0.645 |  |
| us-east-1 | 0.215 | 4781 |
| us-east-2 | 0.205 | 1636 |
| us-gov-east-1 | 0.199 | 1716 |
| us-gov-west-1 | 0.163 | 198 |
| us-west-1 | 0.103 | 3690 |
| us-west-2 | 0.164 | 163 |

