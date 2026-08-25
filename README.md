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
Updated: 2026-08-25T11:19:59.301582+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.015 |  |
| ap-east-1 | 0.659 |  |
| ap-east-2 | 0.603 |  |
| ap-northeast-1 | 0.483 |  |
| ap-northeast-2 | 0.587 |  |
| ap-northeast-3 | 0.506 |  |
| ap-south-1 | 0.887 |  |
| ap-south-2 | 0.899 |  |
| ap-southeast-1 | 0.734 |  |
| ap-southeast-2 | 0.665 |  |
| ap-southeast-3 | 0.795 |  |
| ap-southeast-4 | 0.707 |  |
| ap-southeast-5 | 0.758 |  |
| ap-southeast-6 | 0.680 |  |
| ap-southeast-7 | 0.842 |  |
| ca-central-1 | 0.237 | 18 |
| ca-west-1 | 0.205 |  |
| eu-central-1 | 0.533 |  |
| eu-central-2 | 0.556 |  |
| eu-north-1 | 0.595 |  |
| eu-south-1 | 0.553 |  |
| eu-south-2 | 0.570 |  |
| eu-west-1 | 0.455 |  |
| eu-west-2 | 0.490 |  |
| eu-west-3 | 0.517 |  |
| il-central-1 | 0.687 |  |
| me-central-1 | 0.889 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.236 |  |
| sa-east-1 | 0.643 |  |
| us-east-1 | 0.193 | 5060 |
| us-east-2 | 0.196 | 1684 |
| us-gov-east-1 | 0.201 | 1883 |
| us-gov-west-1 | 0.153 | 227 |
| us-west-1 | 0.150 | 4050 |
| us-west-2 | 0.151 | 188 |

