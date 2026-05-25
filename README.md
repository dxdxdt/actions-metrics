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
Updated: 2026-05-25T02:41:28.957185+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.993 |  |
| ap-east-1 | 0.703 |  |
| ap-east-2 | 0.648 |  |
| ap-northeast-1 | 0.533 |  |
| ap-northeast-2 | 0.636 |  |
| ap-northeast-3 | 0.556 |  |
| ap-south-1 | 0.878 |  |
| ap-south-2 | 0.893 |  |
| ap-southeast-1 | 0.782 |  |
| ap-southeast-2 | 0.685 |  |
| ap-southeast-3 | 0.836 |  |
| ap-southeast-4 | 0.722 |  |
| ap-southeast-5 | 0.808 |  |
| ap-southeast-6 | 0.706 |  |
| ap-southeast-7 | 0.890 |  |
| ca-central-1 | 0.184 | 16 |
| ca-west-1 | 0.218 |  |
| eu-central-1 | 0.500 |  |
| eu-central-2 | 0.522 |  |
| eu-north-1 | 0.543 |  |
| eu-south-1 | 0.536 |  |
| eu-south-2 | 0.554 |  |
| eu-west-1 | 0.423 |  |
| eu-west-2 | 0.463 |  |
| eu-west-3 | 0.482 |  |
| il-central-1 | 0.659 |  |
| me-central-1 | 0.861 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.225 |  |
| sa-east-1 | 0.608 |  |
| us-east-1 | 0.159 | 4687 |
| us-east-2 | 0.129 | 1611 |
| us-gov-east-1 | 0.134 | 1705 |
| us-gov-west-1 | 0.193 | 195 |
| us-west-1 | 0.153 | 3597 |
| us-west-2 | 0.198 | 160 |

