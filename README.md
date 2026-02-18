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
Updated: 2026-02-18T12:43:34.938278+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.996 |  |
| ap-east-1 | 0.703 |  |
| ap-east-2 | 0.643 |  |
| ap-northeast-1 | 0.523 |  |
| ap-northeast-2 | 0.633 |  |
| ap-northeast-3 | 0.551 |  |
| ap-south-1 | 0.926 |  |
| ap-south-2 | 0.924 |  |
| ap-southeast-1 | 0.778 |  |
| ap-southeast-2 | 0.690 |  |
| ap-southeast-3 | 0.832 |  |
| ap-southeast-4 | 0.731 |  |
| ap-southeast-5 | 0.797 |  |
| ap-southeast-6 | 0.766 |  |
| ap-southeast-7 | 0.881 |  |
| ca-central-1 | 0.180 | 16 |
| ca-west-1 | 0.248 |  |
| eu-central-1 | 0.506 |  |
| eu-central-2 | 0.530 |  |
| eu-north-1 | 0.557 |  |
| eu-south-1 | 0.539 |  |
| eu-south-2 | 0.550 |  |
| eu-west-1 | 0.410 |  |
| eu-west-2 | 0.478 |  |
| eu-west-3 | 0.487 |  |
| il-central-1 | 0.705 |  |
| me-central-1 | 0.890 |  |
| me-south-1 | 0.855 |  |
| mx-central-1 | 0.197 |  |
| sa-east-1 | 0.609 |  |
| us-east-1 | 0.157 | 4139 |
| us-east-2 | 0.129 | 1354 |
| us-gov-east-1 | 0.129 | 1488 |
| us-gov-west-1 | 0.183 | 154 |
| us-west-1 | 0.222 | 3073 |
| us-west-2 | 0.182 | 127 |

