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
Updated: 2026-09-05T18:42:36.633685+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.959 |  |
| ap-east-1 | 0.723 |  |
| ap-east-2 | 0.661 |  |
| ap-northeast-1 | 0.542 |  |
| ap-northeast-2 | 0.644 |  |
| ap-northeast-3 | 0.568 |  |
| ap-south-1 | 0.919 |  |
| ap-south-2 | 0.960 |  |
| ap-southeast-1 | 0.818 |  |
| ap-southeast-2 | 0.701 |  |
| ap-southeast-3 | 0.852 |  |
| ap-southeast-4 | 0.742 |  |
| ap-southeast-5 | 0.816 |  |
| ap-southeast-6 | 0.729 |  |
| ap-southeast-7 | 0.902 |  |
| ca-central-1 | 0.243 | 18 |
| ca-west-1 | 0.258 |  |
| eu-central-1 | 0.482 |  |
| eu-central-2 | 0.495 |  |
| eu-north-1 | 0.529 |  |
| eu-south-1 | 0.496 |  |
| eu-south-2 | 0.510 |  |
| eu-west-1 | 0.399 |  |
| eu-west-2 | 0.425 |  |
| eu-west-3 | 0.453 |  |
| il-central-1 | 0.630 |  |
| me-central-1 | 0.865 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.203 |  |
| sa-east-1 | 0.582 |  |
| us-east-1 | 0.137 | 5085 |
| us-east-2 | 0.142 | 1685 |
| us-gov-east-1 | 0.127 | 1897 |
| us-gov-west-1 | 0.223 | 231 |
| us-west-1 | 0.161 | 4083 |
| us-west-2 | 0.220 | 192 |

