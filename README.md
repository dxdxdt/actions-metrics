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
Updated: 2026-02-14T19:19:07.411490+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.018 |  |
| ap-east-1 | 0.680 |  |
| ap-east-2 | 0.618 |  |
| ap-northeast-1 | 0.500 |  |
| ap-northeast-2 | 0.606 |  |
| ap-south-1 | 0.905 |  |
| ap-south-2 | 0.916 |  |
| ap-southeast-1 | 0.751 |  |
| ap-southeast-2 | 0.645 |  |
| ap-southeast-3 | 0.807 |  |
| ap-southeast-4 | 0.689 |  |
| ap-southeast-5 | 0.771 |  |
| ap-southeast-6 | 0.722 |  |
| ap-southeast-7 | 0.858 |  |
| ca-central-1 | 0.215 | 16 |
| ca-west-1 | 0.182 |  |
| eu-central-1 | 0.528 |  |
| eu-central-2 | 0.545 |  |
| eu-north-1 | 0.578 |  |
| eu-south-1 | 0.568 |  |
| eu-south-2 | 0.564 |  |
| eu-west-1 | 0.451 |  |
| eu-west-2 | 0.495 |  |
| eu-west-3 | 0.522 |  |
| il-central-1 | 0.715 |  |
| me-central-1 | 0.927 |  |
| me-south-1 | 0.873 |  |
| mx-central-1 | 0.245 |  |
| sa-east-1 | 0.647 |  |
| us-east-1 | 0.191 | 4121 |
| us-east-2 | 0.163 | 1340 |
| us-gov-east-1 | 0.160 | 1467 |
| us-gov-west-1 | 0.157 | 147 |
| us-west-1 | 0.138 | 3060 |
| us-west-2 | 0.157 | 125 |

