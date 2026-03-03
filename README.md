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
Updated: 2026-03-03T17:37:48.563314+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.986 |  |
| ap-east-1 | 0.717 |  |
| ap-east-2 | 0.659 |  |
| ap-northeast-1 | 0.538 |  |
| ap-northeast-2 | 0.643 |  |
| ap-northeast-3 | 0.565 |  |
| ap-south-1 | 0.929 |  |
| ap-south-2 | 0.963 |  |
| ap-southeast-1 | 0.796 |  |
| ap-southeast-2 | 0.700 |  |
| ap-southeast-3 | 0.849 |  |
| ap-southeast-4 | 0.744 |  |
| ap-southeast-5 | 0.817 |  |
| ap-southeast-6 | 0.762 |  |
| ap-southeast-7 | 0.897 |  |
| ca-central-1 | 0.146 | 16 |
| ca-west-1 | 0.232 |  |
| eu-central-1 | 0.487 |  |
| eu-central-2 | 0.500 |  |
| eu-north-1 | 0.550 |  |
| eu-south-1 | 0.510 |  |
| eu-south-2 | 0.521 |  |
| eu-west-1 | 0.417 |  |
| eu-west-2 | 0.452 |  |
| eu-west-3 | 0.472 |  |
| il-central-1 | 0.657 |  |
| me-central-1 | 0.850 |  |
| me-south-1 | 0.827 |  |
| mx-central-1 | 0.190 |  |
| sa-east-1 | 0.583 |  |
| us-east-1 | 0.143 | 4212 |
| us-east-2 | 0.099 | 1396 |
| us-gov-east-1 | 0.121 | 1527 |
| us-gov-west-1 | 0.196 | 169 |
| us-west-1 | 0.203 | 3165 |
| us-west-2 | 0.192 | 137 |

