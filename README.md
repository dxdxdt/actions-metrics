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
Updated: 2026-04-06T12:53:48.492510+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.016 |  |
| ap-east-1 | 0.690 |  |
| ap-east-2 | 0.623 |  |
| ap-northeast-1 | 0.510 |  |
| ap-northeast-2 | 0.616 |  |
| ap-northeast-3 | 0.539 |  |
| ap-south-1 | 0.902 |  |
| ap-south-2 | 0.897 |  |
| ap-southeast-1 | 0.763 |  |
| ap-southeast-2 | 0.653 |  |
| ap-southeast-3 | 0.817 |  |
| ap-southeast-4 | 0.695 |  |
| ap-southeast-5 | 0.784 |  |
| ap-southeast-6 | 0.699 |  |
| ap-southeast-7 | 0.863 |  |
| ca-central-1 | 0.241 | 16 |
| ca-west-1 | 0.208 |  |
| eu-central-1 | 0.526 |  |
| eu-central-2 | 0.538 |  |
| eu-north-1 | 0.595 |  |
| eu-south-1 | 0.559 |  |
| eu-south-2 | 0.557 |  |
| eu-west-1 | 0.453 |  |
| eu-west-2 | 0.496 |  |
| eu-west-3 | 0.515 |  |
| il-central-1 | 0.719 |  |
| me-central-1 | 0.905 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.234 |  |
| sa-east-1 | 0.654 |  |
| us-east-1 | 0.188 | 4447 |
| us-east-2 | 0.168 | 1486 |
| us-gov-east-1 | 0.169 | 1630 |
| us-gov-west-1 | 0.172 | 191 |
| us-west-1 | 0.120 | 3363 |
| us-west-2 | 0.172 | 153 |

