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
Updated: 2026-04-02T17:43:44.368423+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.962 |  |
| ap-east-1 | 0.725 |  |
| ap-east-2 | 0.665 |  |
| ap-northeast-1 | 0.540 |  |
| ap-northeast-2 | 0.650 |  |
| ap-northeast-3 | 0.576 |  |
| ap-south-1 | 0.858 |  |
| ap-south-2 | 0.873 |  |
| ap-southeast-1 | 0.797 |  |
| ap-southeast-2 | 0.707 |  |
| ap-southeast-3 | 0.861 |  |
| ap-southeast-4 | 0.759 |  |
| ap-southeast-5 | 0.825 |  |
| ap-southeast-6 | 0.738 |  |
| ap-southeast-7 | 0.906 |  |
| ca-central-1 | 0.194 | 16 |
| ca-west-1 | 0.223 |  |
| eu-central-1 | 0.473 |  |
| eu-central-2 | 0.500 |  |
| eu-north-1 | 0.538 |  |
| eu-south-1 | 0.507 |  |
| eu-south-2 | 0.514 |  |
| eu-west-1 | 0.400 |  |
| eu-west-2 | 0.435 |  |
| eu-west-3 | 0.458 |  |
| il-central-1 | 0.648 |  |
| me-central-1 | 0.845 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.262 |  |
| sa-east-1 | 0.587 |  |
| us-east-1 | 0.140 | 4420 |
| us-east-2 | 0.150 | 1474 |
| us-gov-east-1 | 0.153 | 1621 |
| us-gov-west-1 | 0.229 | 191 |
| us-west-1 | 0.194 | 3337 |
| us-west-2 | 0.218 | 153 |

