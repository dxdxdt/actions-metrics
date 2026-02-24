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
Updated: 2026-02-24T19:45:29.422615+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.039 |  |
| ap-east-1 | 0.658 |  |
| ap-east-2 | 0.594 |  |
| ap-northeast-1 | 0.480 |  |
| ap-northeast-2 | 0.594 |  |
| ap-northeast-3 | 0.507 |  |
| ap-south-1 | 0.891 |  |
| ap-south-2 | 0.869 |  |
| ap-southeast-1 | 0.738 |  |
| ap-southeast-2 | 0.614 |  |
| ap-southeast-3 | 0.786 |  |
| ap-southeast-4 | 0.653 |  |
| ap-southeast-5 | 0.752 |  |
| ap-southeast-6 | 0.666 |  |
| ap-southeast-7 | 0.834 |  |
| ca-central-1 | 0.286 | 16 |
| ca-west-1 | 0.184 |  |
| eu-central-1 | 0.547 |  |
| eu-central-2 | 0.573 |  |
| eu-north-1 | 0.603 |  |
| eu-south-1 | 0.581 |  |
| eu-south-2 | 0.596 |  |
| eu-west-1 | 0.469 |  |
| eu-west-2 | 0.506 |  |
| eu-west-3 | 0.525 |  |
| il-central-1 | 0.763 |  |
| me-central-1 | 0.940 |  |
| me-south-1 | 0.889 |  |
| mx-central-1 | 0.242 |  |
| sa-east-1 | 0.668 |  |
| us-east-1 | 0.220 | 4179 |
| us-east-2 | 0.205 | 1376 |
| us-gov-east-1 | 0.206 | 1504 |
| us-gov-west-1 | 0.142 | 161 |
| us-west-1 | 0.088 | 3113 |
| us-west-2 | 0.142 | 130 |

